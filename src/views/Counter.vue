<template>
  <div>
    <text @click='increment' class='btn btn-default'>Increment +1</text>
    <text @click='decrement' class='btn btn-danger'>Decrement -1</text>
    <text class='text'>Count is {{ count }}</text>
  </div>
</template>

<script>
  import { mapGetters, mapActions } from 'vuex'

  export default {
    methods: {
      ...mapActions([
        'increment',
        'decrement'
      ])
    },
    computed: {
      ...mapGetters({
        count: 'getCount'
      })
    }
  }

</script>

<style scoped>
  .btn {
    height: 50px;
    line-height: 50px;
    text-align: center;
    border: 1px solid transparent;
    border-radius: 4px;
  }
  
  .btn-default {
    color: #fff;
    background-color: #337ab7;
    border-color: #2e6da4;
  }
  
  .btn-danger {
    color: #fff;
    background-color: #d9534f;
    border-color: #d43f3a;
  }
  
  .text {
    text-align: center;
    font-size: 40px;
    margin-top: 10px;
  }
</style>