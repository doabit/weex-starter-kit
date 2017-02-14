const baseURL = 'https://jsonplaceholder.typicode.com'
const stream = weex.requireModule('stream')

export const getTopics = ({ commit, state }) => {
  stream.fetch({
    method: 'GET',
    url: `${baseURL}/posts`,
    type: 'json'
  }, (response) => {
    if (response.status == 200) {
      commit('TOPICS_LIST', response.data)
    }
    else {
      console.log(response)
    }
  }, () => {})
}

export const increment = ({ commit }) => commit('INCREMENT')
export const decrement = ({ commit }) => commit('DECREMENT')
