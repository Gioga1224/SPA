<template>
    <div>
        <Header /> 
        <div class = "row">
            
            <div class="col-md-8 " >
                <table class="table table-hover table-dark" style = "background-color:cyan">
                <thead>
                    <tr>
                    <th scope="col">IdEnvio</th>
                    <th scope="col">Tcircuito</th>
                    <th scope="col">Ncliente</th>
                    <th scope="col">Cantidad</th>
                    <th scope="col">Ciudad</th>
                    <th scope="col">Fecha</th>
                    <th scope="col">Descripcion</th>
                    <th scope="col">Costo</th>
                    <th scope="col">Editar</th>
                    <th scope="col">Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                     <tr v-for="dato, i in datos" :key=i>
                            <th scope="row">{{dato.id_envio}}</th>
                            <td>{{dato.tcircuito}}</td>
                            <td>{{dato.ncliente}}</td>
                            <td>{{dato.cantidad}}</td>
                            <td>{{dato.ciudad}}</td>
                            <td>{{dato.fecha}}</td>
                            <td>{{dato.descripcion}}</td>
                            <td>{{dato.costo}}</td>
                            <td><b-button variant="success" v-on:click="editar(dato.id_circuito)">Editar</b-button></td>
                            <td>  <b-button variant="danger" v-on:click="eliminar(dato.id_circuito)">Eliminar</b-button></td>
                        </tr>

                    
                    
                </tbody>
                </table>
             </div>
             <div class = "col-md-4">
                <div>
                    <br/>
                    <h4>Formulario de envio </h4>
                    <br/>
                    <form action="" class="form-horizontal">
                        <div class = "row">
                            <div class = "col-md-6">
                                <label for="id_envio">id_envio</label>
                                <br/>
                                <input class="id_envio" id = "id_envio" type = "number" v-model="form.id_envio">
                            </div>
                        </div> 
                        <div class = "row">
                            <div class = "col-md-6">
                                <label for="Tcircuito">Tcircuito</label>
                                <br/>
                                <input class="Tcircuito" id = "Tcircuito" type = "number" v-model="form.tcircuito">
                            </div>
                            <div class = "col-md-6">
                                <label for="Ncliente">Ncliente</label>
                                <br/>
                                <input class="Ncliente" id = "Ncliente" type = "number" v-model="form.ncliente">
                            </div>
                           
                            
                        </div>
                         <br/>
                        <div class = "row">
                            <div class = "col-md-6">
                                <label for="cantidad">Cantidad</label>
                                <br/>
                                <input class="cantidad" id= "cantidad" type = "text" v-model="form.cantidad">
                            </div>
                            <div class = "col-md-6">
                                <label for="ciudad">Ciudad</label>
                                <br/>
                                <input class="ciudad" id="ciudad" type = "text" v-model="form.ciudad">
                            </div>
                        </div>
                        <br/>
                        <div class = "row">
                            <div class = "col-md-6">
                                <label for="fecha">Fecha</label>
                                <br/>
                                <input class="fecha" id= "fecha" type = "text" v-model="form.fecha">
                            </div>
                            <div class = "col-md-6">
                                <label for="costo">Costo</label>
                                <br/>
                                <input class="costo" id="costo" type = "number" v-model="form.costo">
                            </div>
                        </div>
                         <br/>
                         <center>
                        <div>
                            <div class = "col-md-12">
                                <label for="descripcion">Descripción</label>
                                <br/>
                                <input class="descripcion" id= "descripcion" type = "text" v-model="form.descripcion">
                            </div>
                        </div>
                        </center>
                        <br/>
                        <center>
                        <div>
                            <input type = "submit" value = "Añadir envio" style = "background-color:green"   onclick= "añadir">
                        </div> 
                        </center>
                    </form>
                </div>
                
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
   name:"Envio",
  data:function(){
     return{
        form:{
            "id_envio":"",
            "Tcircuito":"",
            "Ncliente":"",
            "cantidad":"",
            "ciudad":"",
            "fecha":"",
            "descripcion":"",
            "costo":""
            
        },
     }
  },
   components:{
       Header,
       Footer
   },
   created(){
       axios.get('http://localhost:8081/envio').then(response => {
       this.datos = response.data;
       })
   },
   methods:{
       añadir(){
            axios.put("http://localhost:8081/envio", this.form).then( data =>{
            console.log(data);
         })
       }
   },
   mounted:function(){
       this.form.id_envio = this.$route.params.id_envio;
       axios.get('http://localhost:8081/envio').then( datos =>{
        
       this.form.id_envio = this.$route.params.id_envio;
       this.form.Tcircuito = datos.data.Tcircuito;
       this.form.Ncliente = datos.data.Ncliente;
       this.form.cantidad = datos.data.cantidad;
       this.form.ciudad = datos.data.ciudad;
       this.form.fecha = datos.data.fecha;
       this.form.descripcion = datos.data.descripcion;
       this.form.costo = datos.data.costo;
       console.log(this.form)
       })
   }
}
</script>