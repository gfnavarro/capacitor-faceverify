import { WebPlugin } from '@capacitor/core';

import type { FaceVerifyPlugin } from './definitions';

export class FaceVerifyWeb extends WebPlugin implements FaceVerifyPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
