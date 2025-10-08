import router from '@ohos.router'
import { ArcList, ArcListItem, ComponentContent } from '@kit.ArkUI'


@Builder
function header() {
  Column() {
    Text('Video Options')
      .fontSize(24)
      .fontWeight(FontWeight.Bold)
      .textAlign(TextAlign.Center)
      .margin({ top: 16, bottom: 12 })
      .fontColor('#FFF8DC')
  }
}

@Entry
@Component
struct VideoPlayer {
  watchSize: string = '466px'
  context: UIContext = this.getUIContext()
  header: ComponentContent<object> = new ComponentContent(this.context, wrapBuilder(header))
  private uiContext: UIContext = this.getUIContext()

  build() {
    Flex() {
      Row() {
        Column() {
          ArcList({ header: this.header }) {
            ArcListItem() {
              Row({ space: 10 }) {
                Image($r('app.media.directory'))
                  .fillColor('#8B4513')
                  .width(32)
                  .height(32)
                  .objectFit(ImageFit.Contain)
                  .margin({ right: 10 })
                Text('Local Video').fontColor('#8B4513')
              }
              .alignItems(VerticalAlign.Center)
              .backgroundColor('#FFF8DC')
              .borderRadius(30)
              .margin({
                top: 6,
                bottom: 6,
                left: 12,
                right: 12
              })
              .padding({
                top: 10,
                bottom: 10,
                left: 16,
                right: 16
              })
              .onClick(() => {
                router.pushUrl({ url: 'pages/LocalVideoPlayer' })
              });
            }
            ArcListItem() {
              Row({ space: 10 }) {
                Image($r('app.media.url'))
                  .fillColor('#8B4513')
                  .width(32)
                  .height(32)
                  .objectFit(ImageFit.Contain)
                  .margin({ right: 10 })
                Text('Network Video').fontColor('#8B4513')
              }
              .alignItems(VerticalAlign.Center)
              .backgroundColor('#FFF8DC')
              .borderRadius(30)
              .margin({
                top: 6,
                bottom: 6,
                left: 12,
                right: 12
              })
              .padding({
                top: 10,
                bottom: 10,
                left: 16,
                right: 16
              })
              .onClick(() => {
                router.pushUrl({ url: 'pages/NetworkVideoPlayer' })
              });
            }

          }

        }

      }
    }.width(this.watchSize)
    .height(this.watchSize)
    .backgroundColor('#8B4513')
  }
}

