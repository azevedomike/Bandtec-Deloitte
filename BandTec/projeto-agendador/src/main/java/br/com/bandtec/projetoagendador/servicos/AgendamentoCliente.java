package br.com.bandtec.projetoagendador.servicos;

import br.com.bandtec.projetoagendador.entities.Cliente;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import repository.ClienteRepository;

import java.time.LocalDate;
import java.util.List;

@Service
public class AgendamentoCliente {

    @Autowired
    private ClienteRepository repository;

    @Scheduled(fixedRate =  24*60*60*1000)
    public void emailAniversariantes(){
        List<Cliente> clientes = repository.findBydiaNascandmesNasc(LocalDate.now().getDayOfMonth(),LocalDate.now().getMonthValue());

        System.out.println(clientes.size()+ " essa é a quantidade de pessoas");

        ForEac
    }



}
