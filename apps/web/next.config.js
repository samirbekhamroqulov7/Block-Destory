/** @type {import('next').NextConfig} */ 
const nextConfig = { 
  reactStrictMode: true, 
  swcMinify: false,  // βª«ξη ¥¬ ¤«ο Next.js 14+ 
  typescript: { 
    ignoreBuildErrors: true, 
  }, 
  images: { 
    unoptimized: true, 
  }, 
} 
 
module.exports = nextConfig; 
