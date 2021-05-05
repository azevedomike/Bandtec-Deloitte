package br.com.bandtec.projetoac3mike.controller;


import br.com.bandtec.projetoac3mike.Agendamento;
import br.com.bandtec.projetoac3mike.FilaObj;
import br.com.bandtec.projetoac3mike.PilhaObj;
import br.com.bandtec.projetoac3mike.dominio.BanhoTosa;
import br.com.bandtec.projetoac3mike.repository.BanhoTosaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.awt.image.ImagingOpException;
import java.io.IOException;
import java.util.*;

@RestController
@RequestMapping("/banhotosa")
public class BanhoTosaController {

    @Autowired
    private BanhoTosaRepository repository;

    private PilhaObj<Integer> pilha = new PilhaObj<>(15);

    private FilaObj<Agendamento> fila = new FilaObj<>(15);

    private Map<UUID,BanhoTosa> horariosAgendamento = new HashMap<>();


    @GetMapping
    public ResponseEntity listar(){
        List<BanhoTosa> bt = repository.findAll();
        if(bt.isEmpty()){
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(bt);
    }


    @PostMapping
    public ResponseEntity registrar(@RequestBody BanhoTosa bt){
        repository.save(bt);
        pilha.push(bt.getId());
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

    @GetMapping("/agendar/{id}")
    public ResponseEntity agendar(@PathVariable Integer id){
        if(repository.existsById(id)){
            UUID senha = UUID.randomUUID();
            Agendamento agenda = new Agendamento(senha, id);
            fila.insert(agenda);
            fila.exibe();
            return ResponseEntity.accepted().header("senha: ", senha.toString()).build();

        }
        return ResponseEntity.badRequest().build();
    }

    @GetMapping("/verificar/{senha}")
    public ResponseEntity verificar(@PathVariable UUID senha){
        BanhoTosa banhoTosa = horariosAgendamento.get(senha);
        if(banhoTosa == null){
            return ResponseEntity.notFound().build();
        }
            return ResponseEntity.ok(banhoTosa);

    }

    @Scheduled(fixedDelay = 60000)
    public void marcarAgendamento(){
        if(!fila.isEmpty()){
            Agendamento agenda = fila.poll();
            Optional<BanhoTosa> a1 = repository.findById(agenda.getHoraAgendamento());
            if (a1.isPresent()){
                BanhoTosa bt = a1.get();
                horariosAgendamento.put(agenda.getSenha(),bt);
            }else{
                System.out.println("Não há agendamentos");
            }
        }
    }

}
