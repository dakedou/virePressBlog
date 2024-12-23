<template>
  <div class="imgCont" ref="imgCont" @mousewheel.prevent="rollImg($event)">
    <!-- <div class="iconBtn">
      <span class="refreshBtn">
        <i class="el-icon-zoom-out" @click.stop="outImg('out')">S</i>
        <i class="el-icon-zoom-in" @click.stop="outImg('in')">F</i>
        <i @click.stop="rotate('left')" class="el-icon-refresh-left">L</i>
        <i @click.stop="rotate('right')" class="el-icon-refresh-right right">R</i>
        <slot name="addIcon"></slot>
      </span>
    </div> -->
    <img
      :src="imgUrl"
      class="bigImage"
      ref="imgDiv"
      @mousedown.stop.prevent="moveImg($event)"
      id="img"
    />
  </div>
</template>

<script>
export default {
  name: "imgDeal",
  props: {
    url: {},
  },
  components: {},
  data() {
    return {
      // 图片参数
      params: {
        zoomVal: 1,
        left: 0,
        top: 0,
        currentX: 0,
        currentY: 0,
      },
      deg: 0,
      imgUrl: "/生活分享/photo/0.jpg",
    };
  },
  computed: {},
  watch: {},
  created() {
    this.restImg();
  },
  mounted() {},
  methods: {
    // 初始化数据
    restImg() {
      this.params = {
        zoomVal: 1,
        left: 0,
        top: 0,
        currentX: 0,
        currentY: 0,
      };
      this.deg = 0;
      if (this.$refs.imgDiv) {
        let img = this.$refs.imgDiv;
        img.style.transform = `translate(-50%, -50%) scale(${this.params.zoomVal}) rotate(${this.deg}deg)`;
        img.style.left = "50%";
        img.style.top = "50%";
      }
    },
    // 图片滚动放大
    rollImg(event) {
      this.params.zoomVal += event.wheelDelta / 1200;
      this.rollFunc();
    },
    outImg(flag) {
      if (flag == "out") {
        this.params.zoomVal -= 0.2;
      } else {
        this.params.zoomVal += 0.2;
      }
      this.rollFunc();
    },
    rollFunc() {
      let e = this.$refs.imgDiv;
      if (this.params.zoomVal >= 0.2) {
        e.style.transform = `translate(-50%, -50%) scale(${this.params.zoomVal}) rotate(${this.deg}deg)`;
      } else {
        this.params.zoomVal = 0.2;
        e.style.transform = `translate(-50%, -50%) scale(${this.params.zoomVal}) rotate(${this.deg}deg)`;
        return false;
      }
    },
    // 图片旋转
    rotate(type) {
      let res = this.$refs.imgDiv;
      this.deg = type == "right" ? this.deg + 90 : this.deg - 90;
      res.style.transform = `translate(-50%, -50%) scale(${this.params.zoomVal}) rotate(${this.deg}deg)`;
    },
    // 图片移动
    moveImg(e) {
      e.preventDefault();
      // 获取元素
      let imgWrap = this.$refs.imgCont;
      let img = this.$refs.imgDiv;
      let x = e.pageX - img.offsetLeft;
      let y = e.pageY - img.offsetTop;

      // 添加鼠标移动事件
      imgWrap.addEventListener("mousemove", move);
      function move(e) {
        img.style.left = e.pageX - x + "px";
        img.style.top = e.pageY - y + "px";
      }
      // 添加鼠标抬起事件，鼠标抬起，将事件移除
      img.addEventListener("mouseup", () => {
        imgWrap.removeEventListener("mousemove", move);
      });
      // 鼠标离开父级元素，把事件移除
      imgWrap.addEventListener("mouseout", () => {
        imgWrap.removeEventListener("mousemove", move);
      });
    },
  },
};
</script>

<style scoped>
.imgCont {
  border: 1px solid #555;
  text-align: center;
  vertical-align: middle;
  position: relative;
  overflow: hidden;
  width: 935px;
  height: 700px;
}
.iconBtn {
  position: absolute;
  left: 0;
  bottom: 0;
  height: 35px;
  line-height: 35px;
  background-color: rgba(0, 0, 0, 0.2);
  color: #fff;
  width: 100%;
  z-index: 100;
  font-size: 20px;
}
.iconBtn .refreshBtn i {
  cursor: pointer;
  margin: 0 10px;
}
.bigImage {
  max-width: 100%;
  max-height: 100%;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  cursor: pointer;
  margin: 0 auto;
}
</style>
