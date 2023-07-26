<template>
    
    <div>
        <Header />

                <div class="container">
                <form action="" class="form-horizontal">
                    <div class="form-group left">
                       <label for="id_cliente" class="control-label col-sm-2">id_cliente</label>
                       <div class="col-sm-10">
                          <input type="number" class="form-control" name="id_cliente" id="id_cliente" v-model="form.id_cliente">
                       </div>
                    </div>
                    <div class="form-group left">
                       <label for="nombre" class="control-label col-sm-2">Nombre</label>
                       <div class="col-sm-10">
                          <input type="text" class="form-control" name="nombre" id="nombre" v-model="form.nombre">
                       </div>
                    </div>
                    <div class="form-group left">
                       <label for="correo" class="control-label col-sm-2">Correo</label>
                       <div class="col-sm-10">
                          <input type="text" class="form-control" name="correo" id="correo" v-model="form.correo">
                       </div>
                    </div>
                    <div class="form-group left row">
                      <div class="col">
                            <label for="ciudad" class="control-label col-sm-3">Ciudad</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="ciudad" id="ciudad" v-model="form.ciudad">
                            </div>
                        </div>
                    </div>
                    <div class="form-group left row">
                         <div class="col">
                            <label for="direccion" class="control-label col-sm-12">Dirección</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="direccion" id="direccion" v-model="form.direccion">
                            </div>
                          </div>  
                    </div>
                    

                    <div class="form-group">
                      <button type="button" class="btn btn-primary" v-on:click="editar()">Editar</button>
                      <button type="button" class="btn btn-danger margen" v-on:click="eliminar()" >Eliminar</button>
                      <button type="button" class="btn btn-dark margen" v-on:click="salir()"  >Salir</button>
                    </div> 
                </form>
            </div>





        <Footer />
    </div>
</template>

<script>
import Header from '@/components/header.vue';
import Footer from '@/components/footer.vue';
import axios from 'axios';

export default ({
    name: 'EditarCliente',
     components:{
       Header,
       Footer
    },
    
    data:function(){
     return{
        form:{
            "id_cliente":"",
            "nombre":"",
            "correo":"",
            "ciudad":"",
            "direccion":""
            
        }
     }
    },
    methods:{
        editar(){
            axios.put("http://localhost:8081/clientes/"+this.form.id_cliente, this.form).then( data =>{
            console.log(data);
         })
        },
         salir(){
        this.$router.push("/clientes");
        },
        eliminar(){
        var enviar = {
            "id_cliente" : this.form.id_cliente,
        };
        axios.delete("http://localhost:8081/clientes/"+this.form.id_cliente, { headers : enviar})
        .then( datos => {
            console.log(datos);
           this.$router.push("/clientes");
        }); 
         }
    },
        mounted:function(){
       this.form.id_cliente = this.$route.params.id_cliente;
       axios.get('http://localhost:8081/clientes/').then( datos =>{
        
       this.form.id_cliente = this.$route.params.id_cliente;
       this.form.nombre = datos.data.nombre;
       this.form.correo = datos.data.correo;
       this.form.ciudad = datos.data.ciudad;
       this.form.direccion = datos.data.direccion;
       console.log(this.form)
       })
   }
})
</script>

<style scoped>
 .left{
   text-align: left;
 };
 .margen{
   margin-left: 15px;
   margin-right: 15px;;
 }
</style>