<template>
 <center>
           <div class = "row">
          
        <b-navbar toggleable="lg" type="dark" variant="info">
           <form  v-on:click.prevent="circuito">
            <b-navbar-brand href="#">
                
                    CIRCUITOS 
                
            </b-navbar-brand>
               </form>
               <p>        </p>
               <form  v-on:click.prevent="cliente">
            <b-navbar-brand href="#">
                
                    CLIENTES / USUARIOS
                
            </b-navbar-brand>
            
            </form>
            <p>        </p>
            <form  v-on:click.prevent="envio">
            <b-navbar-brand href="#">
                
                    ENVIOS
                
            </b-navbar-brand>
            </form>
            <p>               </p>   
                <div align="right" >                                              
            <form  v-on:click.prevent="principio" style = "align:right">
            <b-navbar-brand href="#">
                
                    PÁGINA PRINCIPAL
                
            </b-navbar-brand>
            </form>
            </div>   
        </b-navbar>
     
     </div>
</center>
</template>


<script>


export default ({
    methods:{
    circuito() {
        this.$router.push('/dashboard');
    },
    cliente() {
        this.$router.push('/clientes');
    },
    envio() {
        this.$router.push('/envio');
    },
    principio() {
        this.$router.push('/');
    },
}
})

</script>
