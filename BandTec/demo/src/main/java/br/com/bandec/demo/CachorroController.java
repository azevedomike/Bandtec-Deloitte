package br.com.bandec.demo;

import org.springframework.web.bind.annotation.*;

import javax.security.auth.callback.CallbackHandler;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/cachorros")
public class CachorroController {

        private List<Cachorro> cachorros = new ArrayList<>();

        @GetMapping("/listar")
    public List<Cachorro> getCachorro(){
            return  cachorros;
        }
    @PostMapping("/cadastrar")
        public void cadastrarCachorro(@RequestBody Cachorro cachorro){
            cachorros.add(cachorro);
        }


        @GetMapping("/recuperar/{id}")
            public Cachorro getCachorro(@PathVariable int id){
                return cachorros.get(id-1);
        }

        @DeleteMapping("/excluir/{id}")
            public void getCachorro2(@PathVariable int id){
            cachorros.remove(id-1);
        }

        @PutMapping("/alterar/{id}")
            public void alterarCachorro(@PathVariable int id, @RequestBody Cachorro cachorro){
            cachorros.remove(id-1);
            cachorros.add(id-1, cachorro);
        }

}
