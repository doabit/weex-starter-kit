import Router from 'vue-router'

Vue.use(Router)

import IndexView from './views/IndexView.vue'
import AboutView from './views/AboutView.vue'
import Counter from './views/Counter.vue'
import Topics from './views/Topics.vue'


export default new Router({
  // mode: 'abstract',
  routes: [
    { path: '/', component: IndexView },
    { path: '/counter', component: Counter },
    { path: '/topics', component: Topics },
    { path: '/about', component: AboutView }
  ]
})
