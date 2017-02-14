<template>
  <div class="header">
    <div class="logo" @click="jump('/')">
      <image class="image" src="https://news.ycombinator.com/favicon.ico"></image>
    </div>
    <div class="nav">
      <div class="link" @click="jump('/')">
        <text class="title">Home</text>
      </div>
      <div class="link" @click="jump('/counter')">
        <text class="title">Counter</text>
      </div>

      <div class="link" @click="jump('/about')">
        <text class="title">About</text>
      </div>
    </div>
  </div>
</template>