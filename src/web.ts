import { WebPlugin } from '@capacitor/core';

import type { FaceVerifyPlugin } from './definitions';

export class FaceVerifyWeb extends WebPlugin implements FaceVerifyPlugin {
  async showVerify(options: { url: string }): Promise<void> {
    options.url;
  }
}
