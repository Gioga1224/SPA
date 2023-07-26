<template>
  <div class="home">

      <div class="sidenav">
              <div class="login-main-text">
                  <h2>PROYECTO SPA - <br> PAGINA DE INICIO DE SESIÓN</h2>
                  <p>Registrese con datos como cliente, e inicie sesión sin contraseña.</p>
              </div>
            </div>
            <div class="main">
              <div class="col-md-6 col-sm-12">
                  <div class="login-form">
                    <form v-on:submit.prevent="login">
                        <div class="form-group">
                          <label>Usuario</label>
                          <input type="text" class="form-control" placeholder="Usuario" v-model="usuario">
                        </div>
                        <div class="form-group">
                          <label>Contraseña</label>
                          <input type="password" class="form-control" placeholder="Password" v-model="password">
                        </div>
                        <button type="submit" class="btn btn-black">INICIAR</button>
                        
                    </form>
                    <form v-on:submit.prevent="registrarse">
                    <button type="submit" class="btn btn-secondary">REGISTRAR</button>
                    </form>
                  </div>
              </div>
            </div>
  </div>
</template>

<script>

//import axios from 'axios';

export default {
  name: 'Home',
  components: {

  },
  data: function(){
    return{
      usuario: "",
      password: "",
      error: false,
      error_msg: "",
    }
  },
  methods:{
    login(){
      this.$router.push('dashboard');
      //let json = {
      //  "usuario" : this.usuario,
      //  "password" : this.password
      //};
      // Hace el metodo POST y recibe el valor con then y lo recibe en consola
       // axios.post('URL', json)
       //.then( data => {
      // console.log(data);
      //})
    },
    registrarse(){
      this.$router.push('registro');
    }
  }
}
</script>

<style scoped>
  body {
    font-family: "Lato", sans-serif;
}



.main-head{
    height: 150px;
    background: #FFF;
   
}

.sidenav {
    height: 100%;
    background-color: #000;
    overflow-x: hidden;
    padding-top: 20px;
}


.main {
    padding: 0px 10px;
}

@media screen and (max-height: 450px) {
    .sidenav {padding-top: 15px;}
}

@media screen and (max-width: 450px) {
    .login-form{
        margin-top: 10%;
    }

    .register-form{
        margin-top: 10%;
    }
}

@media screen and (min-width: 768px){
    .main{
        margin-left: 40%; 
    }

    .sidenav{
        width: 40%;
        position: fixed;
        z-index: 1;
        top: 0;
        left: 0;
    }

    .login-form{
        margin-top: 80%;
    }

    .register-form{
        margin-top: 20%;
    }
}


.login-main-text{
    margin-top: 20%;
    padding: 60px;
    color: #fff;
}

.login-main-text h2{
    font-weight: 300;
}

.btn-black{
    background-color: #000 !important;
    color: #fff;
}
</style>
