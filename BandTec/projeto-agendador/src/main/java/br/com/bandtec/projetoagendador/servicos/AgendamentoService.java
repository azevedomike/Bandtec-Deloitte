package br.com.bandtec.projetoagendador.servicos;


import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.concurrent.ThreadLocalRandom;

@Service
public class AgendamentoService {

    @Scheduled(fixedRate = 4000)
    public void recitarPoesia(){
        System.out.println("O amor é como fogo que arde sem ver");
    }

    @Scheduled(initialDelay = 5000, fixedRate = 7000)
    public void falarPreguicoso(){
        System.out.println("Eaeeeeee... mannoooooo...(ouvindo um reggae)");
    }

    @Scheduled(fixedRate = 1000)
    public void sortearNumero(){
        int quero = 30;
        System.out.println("Iniciando o sorteio");
        while(true){
            int sorteado = ThreadLocalRandom.current().nextInt(0,500000);
            if (sorteado == quero){
                System.out.println("Fui Sorteado");
                break;
            }
        }
    }

    @Scheduled( fixedDelay = 3000)
    public void recitarMantra(){
        System.out.println("So colhe o que planta");
    }

    @Scheduled(cron = "* * * * * ?")
    public void baterPonto(){
        System.out.println("Batendo ponto as: "+ LocalDateTime.now());
    }

}
