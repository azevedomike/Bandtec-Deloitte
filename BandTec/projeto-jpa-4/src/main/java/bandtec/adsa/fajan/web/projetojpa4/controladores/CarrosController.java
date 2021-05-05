package bandtec.adsa.fajan.web.projetojpa4.controladores;

import bandtec.adsa.fajan.web.projetojpa4.repositorios.CarroRepository;
import bandtec.adsa.fajan.web.projetojpa4.repositorios.FabricanteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/carros")
public class CarrosController {

    @Autowired
    private CarroRepository repository;

    @Autowired
    private FabricanteRepository fabricanteRepository;

    @GetMapping
    public ResponseEntity getCarros() {
        return ResponseEntity.ok(repository.findAll());
    }

    @GetMapping("/simples")
    public ResponseEntity getCarrosSimples() {
        return ResponseEntity.ok(repository.findAllSimples());
    }

    @GetMapping("/fabricantes")
    public ResponseEntity getFabricantes() {
        return ResponseEntity.ok(fabricanteRepository.findAllSimples());
    }
}
