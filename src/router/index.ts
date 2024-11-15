import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import AboutView from '../views/AboutView.vue'
import LoginComponents from '@/components/LoginComponents.vue'
import ServiceView from '../views/ServiceView.vue'
import RegisterComponents from '@/components/RegisterComponents.vue'
import DashboardUsersComponents from '@/components/DashboardUsersComponents.vue'
import DashboardHomeComponents from '@/components/DashboardHomeComponents.vue'
import DashboardChairComponents from '@/components/DashboardChairComponents.vue'
import DashboardLoginComponents from '@/components/DashboardLoginComponents.vue'
import DashboardReportComponents from '@/components/DashboardReportComponents.vue'
// import FormBookComponents from '@/components/FormBookComponents.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/dashboard',
      name: 'dashboard',
      component: DashboardHomeComponents,
      meta: { requiresDashboardLogin: true }
    },
    {
      path: '/users',
      name: 'users',
      component: DashboardUsersComponents,
      meta: { requiresDashboardLogin: true }
    },
    {
      path: '/chair',
      name: 'chair',
      component: DashboardChairComponents,
      meta: { requiresDashboardLogin: true }
    },
    {
      path: '/report',
      name: 'report',
      component: DashboardReportComponents,
      meta: { requiresDashboardLogin: true }
    },
    {
      path: '/about',
      name: 'about',
      component: AboutView
    },
    {
      path: '/service',
      name: 'service',
      component: ServiceView,
      meta: { requiresLogin: true }
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
      path:'/dashlog',
      name: 'dashlog',
      component: DashboardLoginComponents
    },
    {
      path: '/register',
      name: 'register',
      component: RegisterComponents
    },
    // {
    //   path: '/formbook',
    //   name: 'formbook',
    //   component: FormBookComponents
    // }
  ]
  ,scrollBehavior(to, from, savedPosition) {
    if (to.hash) {
        return {
            el: to.hash,
            behavior: 'smooth',
        };
    } else if (savedPosition) {
        return savedPosition;
    } else {
        return { top: 0 };
    }
  }
})

router.beforeEach((to, from, next) => {
  const token = localStorage.getItem('token');

  if (to.matched.some(record => record.meta.requiresLogin)) {
    if (!token) {
      next({ name: 'login' });
    }else {
      next();
    }
  }
  else if (to.matched.some(record => record.meta.requiresDashboardLogin)) {
    if (!token) {
      next({ name: 'dashlog' });
    }else {
      next();
    }
  }else {
    next();
  }
});

export default router
