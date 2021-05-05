package controladores;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/pessoas")
public class PessoaController {

    private List<Pessoa> pessoas = new ArrayList<>();


    @GetMapping
    public List<Pessoa> getPessoas() {
        return pessoas;
    }

    @PostMapping
    public ResponseEntity criar(@RequestBody @Valid Pessoa novaPessoa){
        pessoas.add(novaPessoa);
        return ResponseEntity.created(null).build();
    }
}
