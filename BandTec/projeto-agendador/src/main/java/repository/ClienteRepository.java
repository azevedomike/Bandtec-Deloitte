package repository;

import br.com.bandtec.projetoagendador.entities.Cliente;
import net.bytebuddy.agent.builder.AgentBuilder;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ClienteRepository extends CrudRepository<Cliente, Integer> {


        List<Cliente> findBydiaNascandmesNasc(int dia, int mes);
}
