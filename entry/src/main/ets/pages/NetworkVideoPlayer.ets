import VideoPlayer from '../view/VideoPlayer';

@Component
export struct NetworkVideoPlayer {
  watchSize: string = '466px'
  @State videoSrcNet: string = ''
  @State showVideo: boolean = false
  @Consume('pathStack') pathStack: NavPathStack;

  build() {
    NavDestination() {
      Flex() {
        Column() {
          if (!this.showVideo) {
            TextInput({ placeholder: 'Please write your URL to watch' })
              .fontColor('#8B4513')
              .onChange((newUrl) => {
                this.videoSrcNet = newUrl
              }).margin({ top: 80, bottom: 10 })

            Button('Play Video')
              .fontColor('#8B4513')
              .backgroundColor('#FFF8DC')
              .onClick(() => {
                this.showVideo = true
              })

          } else {
            VideoPlayer({
              videoSrc: this.videoSrcNet
            })
          }

        }
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
      }
      .width(this.watchSize)
      .height(this.watchSize)
      .backgroundColor('#8B4513')
    }
    .hideTitleBar(true)
    .hideBackButton(true)
  }
}


