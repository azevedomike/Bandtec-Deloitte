package controladores;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/download")
public class DownloadController {

        @GetMapping
        public ResponseEntity get1(){
            return ResponseEntity.ok(1);
        }

        @GetMapping(value = "pdf-loko", produces = {"application/pdf"})
        @ResponseBody
        public ResponseEntity getPdf(){
            return ResponseEntity.ok("Só que não");
        }

        @GetMapping(value = "/zip-loko", produces = {"application/x-7z-compressed"})
        @ResponseBody
        public ResponseEntity getZip(){
            HttpHeaders headers = new HttpHeaders();
            headers.add("Content-Disposition","attachment; filename = ifood.zip");
            return new ResponseEntity( "Conteúdo zip fake", HttpStatus.OK);
        }

}
