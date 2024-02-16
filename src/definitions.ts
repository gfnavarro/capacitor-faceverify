export interface FaceVerifyPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
