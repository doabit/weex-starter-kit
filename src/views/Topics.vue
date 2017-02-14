<template>
  <list class="topic-list" @loadmore='fetch' loadmoreoffset="10">
    <header class="header">
      <text class="title">All Topics</text>
    </header>
    <cell class="topic-cell" v-for="topic in topics">
      <div class="panel">
        <text>{{topic.title}}</text>
      </div>
    </cell>
  </list>
</template>

<script>
  const modal = weex.requireModule('modal')

  import { mapGetters } from 'vuex'

  const fetchInitialData = store => {
    return store.dispatch(`getTopics`)
  }
  export default {
    computed: {
      ...mapGetters({
        topics: 'getTopics'
      })
    },
    methods: {
      fetch() {
        console.log('more')
        modal.toast({ message: 'loadmore', duration: 1 })
      }
    },
    mounted() {
      fetchInitialData(this.$store)
    }
  }

</script>
<style scoped>
  .header {
    padding: 25;
    background-color: #efefef;
    border-bottom-color: #eeeeee;
    border-bottom-width: 2;
    border-bottom-style: solid;
  }
  
  .title {
    text-align: center;
  }
  
  .panel {
    flex: 1;
    height: 80px;
    /*margin-left: 75px;*/
    padding-left: 50px;
    padding-right: 50px;
    margin-top: 35px;
    margin-bottom: 35px;
    flex-direction: column;
    justify-content: center;
    border-width: 2px;
    border-style: solid;
    border-color: rgb(162, 217, 192);
    background-color: rgba(162, 217, 192, 0.2);
  }
  
  .text {
    font-size: 50px;
    text-align: center;
    color: #41B883;
  }
</style>