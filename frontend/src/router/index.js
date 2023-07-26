import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Dashboard from '../views/Dashboard.vue'
import Clientes from '../views/Clientes.vue'
import Registro from '../views/Registro.vue'
import Envio from '../views/Envio.vue'
import EditarCircuito from '../views/EditarCircuito.vue'
import EditarCliente from '../views/EditarCliente.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/dashboard',
    name: 'Dashboard',
    component: Dashboard
  },
  {
    path: '/clientes',
    name: 'Clientes',
    component: Clientes
  },
  {
    path: '/registro',
    name: 'Registro',
    component: Registro
  },
  {
    path: '/envio',
    name: 'Envio',
    component: Envio
  },
  {
    path: '/circuitos/:id_circuito',
    name: 'EditarCircuito',
    component: EditarCircuito
  },
  {
    path: '/clientes/:id_cliente',
    name: 'EditarCliente',
    component: EditarCliente
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
