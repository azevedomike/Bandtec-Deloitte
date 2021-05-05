package br.com.bandtec.projetoac3mike.controller;

import br.com.bandtec.projetoac3mike.dominio.BanhoTosa;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;

import static org.junit.jupiter.api.Assertions.*;

class BanhoTosaControllerTest {

    @Test
    @DisplayName("Entidade BanhoTosa está anotada corretamente")
    void anotacoesClasse() {
        Class classe = BanhoTosa.class;
        Annotation[] entities = classe.getDeclaredAnnotationsByType(Entity.class);
        assertEquals(1, entities.length);
        assertTrue(classe.isAnnotationPresent(Entity.class));
        assertTrue(classe.isAnnotationPresent(Entity.class), "Não está anotada com @Entity");


        Annotation table = classe.getDeclaredAnnotation(Table.class);
        assertNotNull(table);
        assertEquals("tbl_BanhoTosa", ((Table) table).name());

    }

    @Test
    @DisplayName("atributo 'nome' deve estar corretamente anotado")
    void anotacoesAtributoNome() throws NoSuchFieldException {
        Class classe = BanhoTosa.class;
        Field atributo = classe.getDeclaredField("nome");

    }


}