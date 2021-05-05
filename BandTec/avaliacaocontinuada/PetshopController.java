package br.com.bandec.avaliacaocontinuada;

import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/petshop")
public class PetshopController {

    private List<Petshop> animal = new ArrayList();

    @GetMapping
    public List listarAnimais(){
        return animal;
    }

    @PostMapping("/cadastrar/cachorro")
        public void cadastrarCachorro(@RequestBody Cachorro cachorro){
        animal.add(cachorro);
    }

    @PostMapping("/cadastrar/gato")
        public void cadastrarGato(@RequestBody Gato gato){
        animal.add(gato);
    }

    @DeleteMapping("/{id}")
        public void deletarAnimais(@PathVariable int id){
        animal.remove(id-1);
        }





}
