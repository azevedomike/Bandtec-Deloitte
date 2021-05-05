package bandtec.com.Projeto04Application;


import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

//@RestController
@RequestMapping ("/carros")
public class CarroMelhoradoController {

        private List<Carro> carros = new ArrayList<>();

        @GetMapping
        public ResponseEntity listarCarros(){
            return ResponseEntity.ok(carros);
        }

        @GetMapping("/{id}")
        public Carro recuperarCarro(@PathVariable int id){
            return carros.get(id-1);
        }

        @PostMapping
        public void criarCarro(@RequestBody Carro novoCarro){
                carros.add(novoCarro);
        }

        @DeleteMapping("/{id}")
        public ResponseEntity excluirCarro(@PathVariable int id){
            carros.remove(id-1);
            return ResponseEntity.status(201).build();
        }

    }
