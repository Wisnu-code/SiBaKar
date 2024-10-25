import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import AboutView from '../views/AboutView.vue'
import LoginComponents from '@/components/LoginComponents.vue'
import ServiceView from '../views/ServiceView.vue'
import RegisterComponents from '@/components/RegisterComponents.vue'
import FormBookComponents from '@/components/FormBookComponents.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/about',
      name: 'about',
      component: AboutView
    },
    {
      path: '/service',
      name: 'service',
      component: ServiceView
    },
    {
      path: '/about',
      name: 'about',
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import('../views/AboutView.vue')
    },
    {
      path:'/login',
      name: 'login',
      component: LoginComponents
    },
    {
      path: '/register',
      name: 'register',
      component: RegisterComponents
    },
    {
      path: '/formbook',
      name: 'formbook',
      component: FormBookComponents
    }
  ]
})

export default router
