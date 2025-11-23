import VideoPlayer from '../view/VideoPlayer'

@Component
export struct LocalVideoPlayer {
  watchSize: string = '466px'
  private controller: VideoController = new VideoController()
  private previewUris: Resource = $r('app.media.startIcon')
  private innerResource: Resource = $rawfile('huawei_video_1.mp4')
  @Consume('pathStack') pathStack: NavPathStack;

  build() {
    NavDestination() {
      Flex() {
        Column() {

          VideoPlayer({
            videoSrc: this.innerResource
          })
        }
        .alignItems(HorizontalAlign.Center)
        .justifyContent(FlexAlign.Center)

      }.width(this.watchSize).height(this.watchSize).backgroundColor('#8B4513')
    }.hideTitleBar(true)
    .hideBackButton(true)

  }
}