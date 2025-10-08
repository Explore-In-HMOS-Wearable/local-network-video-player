import router from '@ohos.router'
import VideoPlayer from '../view/VideoPlayer';


@Entry
@Component
export struct Player {
  watchSize: string = '466px'
  @State videoSrcNet: string = ''
  @State showVideo: boolean = false

  build() {
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
              console.log('videosrc' + this.videoSrcNet)
            })

        } else {
          VideoPlayer({
            videoSrc: this.videoSrcNet
          })
          Text()
            .onClick(() => {
              console.log('videosrc' + this.videoSrcNet)
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
}


