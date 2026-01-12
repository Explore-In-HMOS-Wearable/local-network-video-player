import { ArcList, ArcListItem, ComponentContent } from '@kit.ArkUI'
import { NetworkVideoPlayer } from './NetworkVideoPlayer'
import { LocalVideoPlayer } from './LocalVideoPlayer'


@Builder
function header() {
    Text('Video Options')
      .fontSize(24)
      .fontWeight(FontWeight.Bold)
      .textAlign(TextAlign.Center)
      .margin({ top: 16, bottom: 12 })
      .fontColor('#FFF8DC')
}

@Entry
@Component
export struct VideoPlayer {
  watchSize: string = '466px'
  context: UIContext = this.getUIContext()
  header: ComponentContent<object> = new ComponentContent(this.context, wrapBuilder(header))
  private uiContext: UIContext = this.getUIContext()
  @Provide('pathStack') pathStack: NavPathStack = new NavPathStack()

  @Builder
  PageMap(name: string) {
    if (name === 'LocalVideoPlayer') {
      LocalVideoPlayer()
    } else if (name === 'NetworkVideoPlayer') {
      NetworkVideoPlayer()
    }
  }

  build() {
    Navigation(this.pathStack) {
      Flex() {
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
                  this.pathStack.pushPathByName('LocalVideoPlayer', null)
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
                  this.pathStack.pushPathByName('NetworkVideoPlayer', null)
                });
              }

            }

        
      }.width(this.watchSize)
      .height(this.watchSize)
      .backgroundColor('#8B4513')
    }
    .mode(NavigationMode.Stack)
    .hideTitleBar(true)
    .hideBackButton(true)
    .navDestination(this.PageMap)
  }
}

