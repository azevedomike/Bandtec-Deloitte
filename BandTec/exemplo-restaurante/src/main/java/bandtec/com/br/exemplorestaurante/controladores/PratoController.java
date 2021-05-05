package bandtec.com.br.exemplorestaurante.controladores;

import bandtec.com.br.exemplorestaurante.FilaObj;
import bandtec.com.br.exemplorestaurante.Pedido;
import bandtec.com.br.exemplorestaurante.PilhaObj;
import bandtec.com.br.exemplorestaurante.dominio.Prato;
import bandtec.com.br.exemplorestaurante.repositorios.PratoRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.*;

@RestController
@RequestMapping("/pratos")
public class PratoController {

    @Autowired
    private PratoRepositorio repository;


    private PilhaObj<Integer> pilha = new PilhaObj<>(20);

    private FilaObj<Pedido> fila = new FilaObj<>(20);

    private Map<UUID,Prato> pratosProntos = new HashMap<>();


    @GetMapping
    public ResponseEntity listar(){
        List<Prato> pratos = repository.findAll();


        if(pratos.isEmpty()){
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(pratos);
    }

    @PostMapping
    public ResponseEntity cadastrar(@RequestBody Prato prato){
        repository.save(prato);
        pilha.push(prato.getId());
        return ResponseEntity.created(null).build();
    }

    @DeleteMapping
    public ResponseEntity desfazer(){
        if(pilha.isEmpty()){
            return ResponseEntity.ok().build();
        }
        repository.deleteById(pilha.pop());
        pilha.exibe();
        return ResponseEntity.ok().build();
    }

    @GetMapping("/preparar/{id}")
    public ResponseEntity preparar(@PathVariable Integer id){
        if(!repository.existsById(id)){
            ResponseEntity.badRequest().build();
        }
        UUID senha = UUID.randomUUID();
        Pedido pedido = new Pedido(senha ,id);
        fila.insert(pedido);
        fila.exibe();
        return ResponseEntity.accepted().header("senha", senha.toString()).build();
    }

    @GetMapping("/consultar/{senha}")
    public ResponseEntity consultar(@PathVariable UUID senha){
        Prato prato = pratosProntos.get(senha);
        if(prato == null){
            return ResponseEntity.notFound().build();
        }

        return ResponseEntity.ok(prato);
    }

    @Scheduled(fixedDelay = 10000)
    public void prepararPrato(){
        if(!fila.isEmpty()){
            Pedido pedido = fila.poll();
            Optional<Prato> optional = repository.findById(pedido.getPrato());
            if(optional.isPresent()){
                Prato prato = optional.get();
                pratosProntos.put(pedido.getSenha(),prato);
            }else{
                System.out.println("Não há pratos prontos");
            }

        }

    }

    @PostMapping("/importar")
    public ResponseEntity importar(@RequestParam("arquivo") MultipartFile arquivo) throws IOException {
        Scanner leitor = new Scanner(arquivo.getInputStream());
        List<Prato> pratos =  new ArrayList<>();

        while(leitor.hasNextLine()){
            String linha = leitor.nextLine();
            String registro = linha.substring(0,2);

            if(registro.equals("02")){
                Prato prato = new Prato();
                prato.setNome(linha.substring(2,32).trim());
                prato.setIngredientes(linha.substring(32,63).trim());
                prato.setPreco(Double.parseDouble(linha.substring(63,68).trim()));

                pratos.add(prato);
            }
        }
        repository.saveAll(pratos);
        return ResponseEntity.ok(arquivo.getOriginalFilename());
    }

}
