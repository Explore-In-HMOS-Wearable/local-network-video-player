@Component
export default struct VideoPlayer {
  private controller: VideoController = new VideoController()
  @Prop videoSrc: string | Resource

  build() {
    Flex({ justifyContent: FlexAlign.Center }) {
      Column() {
        Video({
          src: this.videoSrc,
          controller: this.controller
        })
          .borderRadius(35)
          .onUpdate((event) => {
            console.info('Video update.');
          })
          .onPrepared((event) => {
            console.info('Video prepared.');
          })
          .onError(() => {
            console.info('Video error.');
          })
          .onStop(() => {
            console.info('Video stopped.');
          })
      }
    }.height('88%').width('88%').padding({ top: 31, left: 30 })
  }
}