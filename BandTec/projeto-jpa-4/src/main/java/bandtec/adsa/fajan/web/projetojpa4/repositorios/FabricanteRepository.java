package bandtec.adsa.fajan.web.projetojpa4.repositorios;

import bandtec.adsa.fajan.web.projetojpa4.dominios.Fabricante;
import bandtec.adsa.fajan.web.projetojpa4.visoes.FabricanteSimples;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import java.util.List;

public interface FabricanteRepository extends CrudRepository<Fabricante, Integer> {

    @Query("select f from Fabricante f")
    List<FabricanteSimples> findAllSimples();
}
