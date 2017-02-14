<template>
  <div>
    <div class="header">
      <div class="logo" @click="jump('/')">
        <image class="image" src="https://market.dotwe.org/assets/images/logo.png"></image>
      </div>
      <div class="nav">
        <div class="link" @click="jump('/')">
          <text class="title">Home</text>
        </div>
        <div class="link" @click="jump('/counter')">
          <text class="title">Counter</text>
        </div>
        <div class="link" @click="jump('/topics')">
          <text class="title">Topics</text>
        </div>
        <div class="link" @click="jump('/about')">
          <text class="title">About</text>
        </div>
      </div>
    </div>
    <div @androidback="back" style="flex: 1">
      <router-view style="flex:1"></router-view>
    </div>
  </div>
</template>


<script>
  export default {
    methods: {
      back: function () {
        this.$router.back()
      }
    }
  }

</script>

<style scoped>
  .header {
    position: relative;
    height: 120px;
    margin-bottom: 3px;
    border-bottom-width: 2px;
    border-bottom-style: solid;
    border-bottom-color: #DDDDDD;
    background-color: #000000;
  }
  
  .logo {
    position: relative;
    width: 50px;
    height: 50px;
    top: 35px;
    left: 35px;
  }
  
  .image {
    width: 44px;
    height: 44px;
  }
  
  .nav {
    display: flex;
    position: absolute;
    left: 120px;
    top: 35px;
    flex-direction: row;
    flex-wrap: nowrap;
    justify-content: flex-start;
    align-items: center;
  }
  
  .link {
    padding-left: 15px;
    padding-right: 15px;
  }
  
  .title {
    font-family: Verdana, Geneva, sans-serif;
    font-size: 32px;
    line-height: 44px;
    color: #FFFFFF;
  }
</style>