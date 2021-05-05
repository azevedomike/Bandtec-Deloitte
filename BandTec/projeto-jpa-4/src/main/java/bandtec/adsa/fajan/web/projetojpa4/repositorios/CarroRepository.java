package bandtec.adsa.fajan.web.projetojpa4.repositorios;

import bandtec.adsa.fajan.web.projetojpa4.dominios.Carro;
import bandtec.adsa.fajan.web.projetojpa4.visoes.CarroSimples;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.*;

public interface CarroRepository extends CrudRepository<Carro, Integer> {

    @Query("select new bandtec.adsa.fajan.web.projetojpa4.visoes.CarroSimples(c.id, c.modelo) from Carro c")
    List<CarroSimples> findAllSimples();
}
