import { registerPlugin } from '@capacitor/core';

import type { FaceVerifyPlugin } from './definitions';

const FaceVerify = registerPlugin<FaceVerifyPlugin>('FaceVerify', {
  web: () => import('./web').then(m => new m.FaceVerifyWeb()),
});

export * from './definitions';
export { FaceVerify };
