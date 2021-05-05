package bandtec.com.Projeto04Application;


import org.springframework.web.bind.annotation.*;
//import org.w3c.dom.stylesheets.LinkStyle;

import java.util.List;
import java.util.ArrayList;

//@RestController
@RequestMapping ("/carros")
public class CarroController {

        private List<Carro> carros = new ArrayList<>();

        @GetMapping
        public List listarCarros(){
            return carros;
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
        public void excluirCarro(@PathVariable int id){
            carros.remove(id-1);
        }

    }
