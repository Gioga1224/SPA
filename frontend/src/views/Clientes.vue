<template>
    
    <div>
        <Header/>
        <div class = "row">
            <div class = "col-md-3">
                 <dl class="row">
                    <dt class="col-sm-4">Descripción: </dt>
                    <dd class="col-sm-8">    Este apartado permite visibilizar a los espectadores del proyecto cuáles clientes se han registrado en la plataforma, con el fin de comprar productos en la misma proporcionado información personal.</dd>
                 </dl>
                 <div class = "row">
                     <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQz_JfFaZi2DhZyY1k8YfBzHGwb1EhjBFZB6W429fRnYTzQZuNM0WmRoDxfIFXpy1fc_oo&usqp=CAU">
                 </div>
                 
                 <br/>
                 
                 
                 
                 
                
            </div>
    
            
            <div class="col-md-9 " >
                <table class="table table-hover table-dark" style = "background-color:cyan">
                <thead>
                    <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Correo</th>
                    <th scope="col">Ciudad</th>
                    <th scope="col">Dirección</th>
                    <th scope="col">Editar</th>
                    <th scope="col">Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                    

                    
                   
                        <tr v-for="dato, i in datos" :key=i>
                            <th scope="row">{{dato.id_cliente}}</th>
                            <td>{{dato.nombre}}</td>
                            <td>{{dato.correo}}</td>
                            <td>{{dato.ciudad}}</td>
                            <td>{{dato.direccion}}</td>
                            <td><b-button variant="success" v-on:click="editar()">Editar</b-button></td>
                            <td><b-button variant="danger" v-on:click="eliminar()">Eliminar</b-button></td>
                        </tr>
                    
                    
                </tbody>
                </table>
             </div>
             
    
        </div>
    
        <Footer />
    </div>
    
</template>

<script>
import Header from '@/components/header.vue';
import Footer from '@/components/footer.vue';
import axios from 'axios';

export default {
   name:"Clientes",
   data: () =>({
       datos: null
       ///
   }),
   
   components:{
       Header,
       Footer
   },
   created(){
       axios.get('http://localhost:8081/clientes').then(response => {
       this.datos = response.data;
       })
   },

   methods:{
       editar(id_cliente) {
       this.$router.push(`/clientes/${id_cliente}`)
      },

        eliminar(id_cliente){
        this.$router.push(`/clientes`)
        axios.delete('http://localhost:8081/clientes/:'+ id_cliente).then(response => {
       this.datos = response.data;
       })
         }
   }

}
</script>