<template>
    <div>
        <Header/> 
        <div class = "row">
            
            <div class="col-md-9 " >
                <table class="table table-hover table-dark" style = "background-color:cyan">
                <thead>
                    <tr>
                    <th scope="col">#</th>
                    <th scope="col">Tipo</th>
                    <th scope="col">Link</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Componentes</th>
                    <th scope="col">Costo</th>
                    <th scope="col">Editar</th>
                    <th scope="col">Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                    

                    
                   
                        <tr v-for="dato, i in datos" :key=i>
                            <th scope="row">{{dato.id_circuito}}</th>
                            <td>{{dato.tipo}}</td>
                            <td>{{dato.link}}</td>
                            <td>{{dato.nombre}}</td>
                            <td>{{dato.componentes}}</td>
                            <td>{{dato.costo}}</td>
                            <td><b-button variant="success" v-on:click="editar(dato.id_circuito)">Editar</b-button></td>
                            <td>  <b-button variant="danger" v-on:click="eliminar(dato.id_circuito)">Eliminar</b-button></td>
                        </tr>

                </tbody>
                </table>
             </div>
             <div class = "col-md-3">
                 <dl class="row">
                    <dt class="col-sm-4">Descripción: </dt>
                    <dd class="col-sm-8">        Acá podemos apreciar un pequeño inventario en donde podemos observar la variedad de circuitos integrados/electronicos del catalogo disponible.</dd>
                 </dl>
                 <div class = "row">
                     <img src="https://www.espaciohonduras.net/images/electronica/articulos/Circuito_integrado/Circuito_integrado.jpg">
                 </div>
                 
                 <br/>
                
                
            </div>
            
        </div>
        
        
      


        <Footer />
    </div>
    
</template>




<script >
import Header from '@/components/header.vue';
import Footer from '@/components/footer.vue';
import axios from 'axios';

export default {
   name:"Dashboard",
   data: () =>({
       datos: null
       //[{"id_circuito": "",
        //        "tipo": "",
        //        "link": "",
        //        "nombre": "",
        //        "componentes": "",
        //        "costo": ""}
        //]
   }),
   
   components:{
       Header,
       Footer
   },
   created(){
       axios.get('http://localhost:8081/circuitos/').then(response => {
       this.datos = response.data;
       })
   },
    methods:{
    
    editar(id_circuito) {
       this.$router.push(`/circuitos/${id_circuito}`)
      },

    eliminar(id_circuito){
        this.$router.push(`/dashboard`)
        axios.delete('http://localhost:8081/circuitos/'+ id_circuito).then(response => {
       this.datos = response.data;
       })
 }
}
}
</script>