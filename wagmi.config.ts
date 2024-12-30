import { defineConfig } from '@wagmi/cli'
import { hardhat, foundry } from '@wagmi/cli/plugins'

export default defineConfig({
  out: 'src/generated.ts',
  contracts: [],
  plugins: [
    hardhat({
      project: './',
      include: ['contracts/Lock.sol/**'],
    }),
  ],
}) 