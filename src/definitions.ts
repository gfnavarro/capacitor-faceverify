export interface FaceVerifyPlugin {
  showVerify(options: { url: string }): Promise<void>;
}
