<template>
    
    <div>
        <Header />

                <div class="container">
                <form action="" class="form-horizontal">
                    <div class="form-group left">
                       <label for="id_circuito" class="control-label col-sm-2">id_circuito</label>
                       <div class="col-sm-10">
                          <input type="number" class="form-control" name="id_circuito" id="id_circuito" v-model="form.id_circuito">
                       </div>
                    </div>
                    <div class="form-group left">
                       <label for="tipo" class="control-label col-sm-2">Tipo</label>
                       <div class="col-sm-10">
                          <input type="text" class="form-control" name="nombre" id="tipo" v-model="form.tipo">
                       </div>
                    </div>
                    <div class="form-group left">
                       <label for="link" class="control-label col-sm-2">Link</label>
                       <div class="col-sm-10">
                          <input type="text" class="form-control" name="link" id="link" v-model="form.link">
                       </div>
                    </div>
                    <div class="form-group left row">
                      <div class="col">
                            <label for="nombre" class="control-label col-sm-3">Nombre</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="nombre" id="nombre" v-model="form.nombre">
                            </div>
                        </div>
                        <div class="col">
                          <label for="costo" class="control-label col-sm-5">Costo</label>
                          <div class="col-sm-7">
                              <input type="number" class="form-control" name="costo" id="costo" v-model="form.costo">
                          </div>
                        </div> 
                    </div>
                    <div class="form-group left row">
                         <div class="col">
                            <label for="componentes" class="control-label col-sm-12">Componentes</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="componentes" id="componentes" v-model="form.componentes">
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
    name: 'EditarCircuito',
     components:{
       Header,
       Footer
    },
    
    data:function(){
     return{
        form:{
            "id_circuito":"",
            "tipo":"",
            "link":"",
            "nombre":"",
            "componentes":"",
            "costo":""
            
        }
     }
    },
    methods:{
        editar(){
            axios.put("http://localhost:8081/circuitos/"+this.form.id_circuito, this.form).then( data =>{
            console.log(data);
         })
        },
         salir(){
        this.$router.push("/dashboard");
        },
        eliminar(){
        var enviar = {
            "id_circuito" : this.form.id_circuito,
        };
        axios.delete("http://localhost:8081/circuitos/"+this.form.id_circuito, { headers : enviar})
        .then( datos => {
            console.log(datos);
           this.$router.push("/dashboard");
        });
         }
    },
        mounted:function(){
       this.form.id_circuito = this.$route.params.id_circuito;
       axios.get('http://localhost:8081/circuitos/').then( datos =>{
        
       this.form.id_circuito = this.$route.params.id_circuito;
       this.form.tipo = datos.data.tipo;
       this.form.link = datos.data.link;
       this.form.nombre = datos.data.nombre;
       this.form.componentes = datos.data.componentes;
       this.form.costo = datos.data.costo;
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