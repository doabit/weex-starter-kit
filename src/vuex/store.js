import Vuex from 'vuex'
import * as actions from './actions'
import * as getters from './getters'


if (WXEnvironment.platform !== 'Web') {
  Vue.use(Vuex)
}

const defaultState = {
  topics: [],
  count: 10
}

const state = defaultState

const mutations = {
  TOPICS_LIST: (state, topics) => {
    state.topics = topics
  },

  INCREMENT: (state) => {
    state.count++
  },

  DECREMENT: (state) => {
    state.count--
  }
}

export default new Vuex.Store({
  state,
  actions,
  mutations,
  getters
})
