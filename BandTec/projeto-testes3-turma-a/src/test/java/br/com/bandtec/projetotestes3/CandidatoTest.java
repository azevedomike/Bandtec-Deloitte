package br.com.bandtec.projetotestes3;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Min;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;

import static org.junit.jupiter.api.Assertions.*;

class CandidatoTest {

    @Test
    @DisplayName("Entidade Candidato está anotada corretamente")
    void anotacoesClasse() {
        // Obtendo a classe de Candidato
        Class classe = Candidato.class;

        // obtendo um vetor com as eventuais anotações @Entity
        // sobre Candidato
        Annotation[] entities =
                classe.getDeclaredAnnotationsByType(Entity.class);
        assertEquals(1, entities.length);

        // ou, poderíamos ter feito:
        // verificando se existe a anotação @Entity sobre Candidato
        assertTrue(classe.isAnnotationPresent(Entity.class));

        // ou ainda, com a mensagem de explicação do erro
        assertTrue(classe.isAnnotationPresent(Entity.class),
                "Não está anotada com @Entity");

        // verificando se o "name" da @Table é "tbl_candidato"
        Annotation table = classe.getDeclaredAnnotation(Table.class);
        assertNotNull(table);
        assertEquals("tbl_candidato", ((Table) table).name());

        // poderíamos ter feito o mesmo teste como abaixo:
        Table table2 = (Table) classe.getDeclaredAnnotation(Table.class);
        assertNotNull(table2);
        assertEquals("tbl_candidato", table2.name());

    }

    @Test
    @DisplayName("attibuto 'nome' deve estar corretamente anotado")
    void anotacoesAtributoNome() throws NoSuchFieldException {
        // Recuperando a meta programação da classe Candidato
        Class classe = Candidato.class;

        // Recuperando a meta programação do atributo "nome"
        Field atributo = classe.getDeclaredField("nome");

        // Recuperando (se existir) a anotação @Column do 'nome'
        Column column = atributo.getDeclaredAnnotation(Column.class);

        assertNotNull(column,
                "nome deve estar anotado com @Column");
        assertFalse(column.nullable(),
                "O nullable da Column deve ser false");
        assertEquals(30, column.length(),
                "O length da Column deve ser 30");

    }

    @Test
    @DisplayName("attibuto 'votos' deve estar corretamente anotado")
    void anotacoesAtributoVotos() throws NoSuchFieldException {
        // Recuperando a meta programação da classe Candidato
        Class classe = Candidato.class;

        // Recuperando a meta programação do atributo "votos"
        Field atributo = classe.getDeclaredField("votos");

        // Recuperando (se existir) a anotação @Column do 'nome'
        Min min = atributo.getDeclaredAnnotation(Min.class);

        assertNotNull(min);
        assertEquals(0, min.value());
    }
}