"use client"

import { useEffect, useState } from "react"
import Image from "next/image"
import Link from "next/link"
import { Laugh, Mail, MessageSquare, Sparkles } from "lucide-react"
import { motion } from "framer-motion"

export default function LandingPage() {
  const [isScrolled, setIsScrolled] = useState(false)

  useEffect(() => {
    const handleScroll = () => setIsScrolled(window.scrollY > 10)
    window.addEventListener("scroll", handleScroll)
    return () => window.removeEventListener("scroll", handleScroll)
  }, [])

  return (
    <div className="min-h-screen bg-[#2c0646] text-white overflow-hidden">
      {/* 3D Background Elements */}
      <div className="fixed inset-0 z-0 opacity-10 pointer-events-none">
        {Array.from({ length: 20 }).map((_, i) => (
          <motion.div
            key={i}
            className="absolute rounded-full bg-white"
            style={{
              width: `${Math.random() * 300 + 50}px`,
              height: `${Math.random() * 300 + 50}px`,
              left: `${Math.random() * 100}%`,
              top: `${Math.random() * 100}%`,
              filter: "blur(100px)",
            }}
            animate={{
              x: [0, Math.random() * 50 - 25],
              y: [0, Math.random() * 50 - 25],
            }}
            transition={{
              duration: Math.random() * 10 + 20,
              repeat: Number.POSITIVE_INFINITY,
              repeatType: "reverse",
              ease: "easeInOut",
            }}
          />
        ))}
      </div>

      {/* Navigation */}
      <header
        className={`fixed w-full z-50 transition-all duration-300 ${
          isScrolled ? "bg-[#2c0646]/80 backdrop-blur-md py-2 shadow-lg" : "bg-transparent py-4"
        }`}
      >
        <div className="container mx-auto px-4 flex justify-between items-center">
          <Link href="/" className="flex items-center gap-3">
            <div className="relative">
              <div className="absolute inset-0 bg-white/5 rounded-full blur-md transform -translate-x-1 translate-y-1"></div>
              <Image
                src="/images/logo.png"
                alt="Flapp.meme Logo"
                width={45}
                height={45}
                className="rounded-full relative z-10"
              />
            </div>
            <span className="text-xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-pink-500 to-purple-300">
              Flapp.meme
            </span>
          </Link>
          <nav>
            <ul className="flex gap-6">
              <li>
                <a href="#about" className="relative group">
                  <span className="text-white/80 group-hover:text-white transition-colors">About</span>
                  <span className="absolute -bottom-1 left-0 w-0 h-0.5 bg-gradient-to-r from-pink-500 to-purple-500 group-hover:w-full transition-all duration-300"></span>
                </a>
              </li>
              <li>
                <a href="#contact" className="relative group">
                  <span className="text-white/80 group-hover:text-white transition-colors">Contact</span>
                  <span className="absolute -bottom-1 left-0 w-0 h-0.5 bg-gradient-to-r from-pink-500 to-purple-500 group-hover:w-full transition-all duration-300"></span>
                </a>
              </li>
              <li>
                <a href="#privacy" className="relative group">
                  <span className="text-white/80 group-hover:text-white transition-colors">Privacy Policy</span>
                  <span className="absolute -bottom-1 left-0 w-0 h-0.5 bg-gradient-to-r from-pink-500 to-purple-500 group-hover:w-full transition-all duration-300"></span>
                </a>
              </li>
            </ul>
          </nav>
        </div>
      </header>

      {/* Hero Section */}
      <section className="relative pt-32 pb-20 z-10">
        <div className="container mx-auto px-4">
          <div className="flex flex-col md:flex-row items-center gap-12">
            {/* Left Side */}
            <motion.div
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.8 }}
              className="md:w-1/2 flex flex-col items-center md:items-start"
            >
              <div className="relative mb-8 group">
                <div className="absolute inset-0 bg-gradient-to-br from-pink-500/30 to-purple-500/30 rounded-full blur-xl group-hover:blur-2xl transition-all duration-700 opacity-70"></div>
                <Image
                  src="/images/logo.png"
                  alt="Flapp.meme Logo"
                  width={180}
                  height={180}
                  className="rounded-full relative z-10 border-2 border-white/10"
                />
              </div>

              <motion.h1
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: 0.3, duration: 0.8 }}
                className="text-4xl md:text-5xl lg:text-6xl font-bold mb-6 bg-clip-text text-transparent bg-gradient-to-r from-pink-500 via-purple-300 to-cyan-300 text-center md:text-left"
              >
                Share Memes.
                <br />
                Spread Joy.
              </motion.h1>

              <motion.p
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: 0.5, duration: 0.8 }}
                className="text-xl text-white/80 mb-8 max-w-lg text-center md:text-left"
              >
                The ultimate platform for creating, sharing, and discovering the funniest memes on the internet!
              </motion.p>

              <motion.div
                initial={{ opacity: 0, scale: 0.9 }}
                animate={{ opacity: 1, scale: 1 }}
                transition={{ delay: 0.7, duration: 0.5 }}
                whileHover={{ scale: 1.05, transition: { duration: 0.2 } }}
                whileTap={{ scale: 0.98 }}
                className="relative"
              >
                <div className="absolute inset-0 bg-black/20 rounded-xl blur-md transform translate-y-2"></div>
                <a
                  href="https://play.google.com/store/apps/details?id=com.flapp.meme"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="relative z-10 block"
                >
                  <Image
                    src="/images/google-play-badge.png"
                    alt="Get it on Google Play"
                    width={220}
                    height={66}
                    className="rounded-lg"
                  />
                </a>
              </motion.div>
            </motion.div>

            {/* Right Side - Feature Cards */}
            <motion.div
              initial={{ opacity: 0, x: 50 }}
              animate={{ opacity: 1, x: 0 }}
              transition={{ duration: 0.8, delay: 0.3 }}
              className="md:w-1/2"
            >
              <div className="grid gap-6">
                {[
                  {
                    icon: <Sparkles className="w-6 h-6 text-yellow-300" />,
                    title: "Fresh Memes Daily",
                    description: "New content every day to keep you laughing non-stop!",
                  },
                  {
                    icon: <MessageSquare className="w-6 h-6 text-cyan-300" />,
                    title: "Share & Comment",
                    description: "Interact with fellow meme enthusiasts and share the fun!",
                  },
                  {
                    icon: <Laugh className="w-6 h-6 text-pink-400" />,
                    title: "Create Your Own",
                    description: "Easy-to-use meme generator to unleash your creativity!",
                  },
                ].map((feature, index) => (
                  <motion.div
                    key={index}
                    initial={{ opacity: 0, y: 30 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ delay: 0.8 + index * 0.2, duration: 0.6 }}
                    whileHover={{ y: -5, transition: { duration: 0.2 } }}
                    className="relative group"
                  >
                    <div className="absolute inset-0 bg-white/5 rounded-2xl blur-md transform translate-y-2 group-hover:translate-y-3 transition-transform duration-300"></div>
                    <div className="relative z-10 bg-white/10 backdrop-blur-sm rounded-xl p-6 border border-white/10 shadow-xl overflow-hidden">
                      <div className="absolute inset-0 bg-gradient-to-br from-pink-500/5 to-purple-500/5 opacity-0 group-hover:opacity-100 transition-opacity duration-500"></div>
                      <div className="relative z-10 flex gap-4">
                        <div className="bg-white/10 p-3 rounded-lg">{feature.icon}</div>
                        <div>
                          <h3 className="text-xl font-bold mb-1 text-white">{feature.title}</h3>
                          <p className="text-white/70">{feature.description}</p>
                        </div>
                      </div>
                    </div>
                  </motion.div>
                ))}
              </div>
            </motion.div>
          </div>
        </div>
      </section>

      {/* About Section */}
      <section id="about" className="relative py-20 z-10">
        <div className="container mx-auto px-4">
          <motion.div
            initial={{ y: 30, opacity: 0 }}
            whileInView={{ y: 0, opacity: 1 }}
            transition={{ duration: 0.7 }}
            viewport={{ once: true }}
            className="text-center mb-12"
          >
            <h2 className="text-3xl md:text-4xl font-bold mb-4 bg-clip-text text-transparent bg-gradient-to-r from-pink-400 to-purple-300">
              About Flapp.meme
            </h2>
            <div className="w-20 h-1 bg-gradient-to-r from-pink-500 to-purple-500 mx-auto"></div>
          </motion.div>

          <motion.div
            initial={{ y: 20, opacity: 0 }}
            whileInView={{ y: 0, opacity: 1 }}
            transition={{ delay: 0.3, duration: 0.7 }}
            viewport={{ once: true }}
            className="max-w-3xl mx-auto relative"
          >
            <div className="absolute inset-0 bg-white/5 rounded-2xl blur-lg transform translate-y-4"></div>
            <div className="relative z-10 bg-white/5 backdrop-blur-sm rounded-xl p-8 border border-white/10 shadow-xl">
              <p className="text-lg text-white/90 mb-6">
                Born from a love of internet culture and humor, Flapp.meme is on a mission to spread joy through the
                universal language of memes.
              </p>
              <p className="text-lg text-white/90">
                Our team of meme enthusiasts works tirelessly to create the best platform for discovering, creating, and
                sharing the content that makes us all laugh.
              </p>
            </div>
          </motion.div>
        </div>
      </section>

      {/* Privacy Section */}
      <section id="privacy" className="relative py-20 z-10">
        <div className="container mx-auto px-4">
          <motion.div
            initial={{ y: 30, opacity: 0 }}
            whileInView={{ y: 0, opacity: 1 }}
            transition={{ duration: 0.7 }}
            viewport={{ once: true }}
            className="text-center mb-12"
          >
            <h2 className="text-3xl md:text-4xl font-bold mb-4 bg-clip-text text-transparent bg-gradient-to-r from-pink-400 to-purple-300">
              Privacy Policy
            </h2>
            <div className="w-20 h-1 bg-gradient-to-r from-pink-500 to-purple-500 mx-auto"></div>
          </motion.div>

          <motion.div
            initial={{ y: 20, opacity: 0 }}
            whileInView={{ y: 0, opacity: 1 }}
            transition={{ delay: 0.3, duration: 0.7 }}
            viewport={{ once: true }}
            className="max-w-3xl mx-auto relative"
          >
            <div className="absolute inset-0 bg-white/5 rounded-2xl blur-lg transform translate-y-4"></div>
            <div className="relative z-10 bg-white/5 backdrop-blur-sm rounded-xl p-8 border border-white/10 shadow-xl">
              <div className="space-y-6">
                <div>
                  <h3 className="text-xl font-bold mb-2 text-white">Information We Collect</h3>
                  <p className="text-white/90">
                    We collect information you provide directly to us when you create an account, upload content, or
                    interact with other users. This may include your username, email address, profile picture, and any
                    memes you create or share.
                  </p>
                </div>
                <div>
                  <h3 className="text-xl font-bold mb-2 text-white">How We Use Your Information</h3>
                  <p className="text-white/90">
                    We use the information we collect to provide, maintain, and improve our services, to develop new
                    features, and to protect Flapp.meme and our users.
                  </p>
                </div>
                <div>
                  <h3 className="text-xl font-bold mb-2 text-white">Sharing Your Information</h3>
                  <p className="text-white/90">
                    We do not share your personal information with companies, organizations, or individuals outside of
                    Flapp.meme except in the following cases: with your consent, for legal reasons, or to protect
                    rights, property, and safety.
                  </p>
                </div>
                <div>
                  <h3 className="text-xl font-bold mb-2 text-white">Your Choices</h3>
                  <p className="text-white/90">
                    You can access, update, or delete your account information at any time through your account
                    settings. You can also control the permissions granted to our app through your device settings.
                  </p>
                </div>
              </div>
            </div>
          </motion.div>
        </div>
      </section>

      {/* Contact Section */}
      <section id="contact" className="relative py-20 z-10">
        <div className="absolute inset-0 bg-gradient-to-b from-[#2c0646] via-[#240538] to-[#2c0646] -z-10"></div>
        <div className="container mx-auto px-4">
          <motion.div
            initial={{ y: 30, opacity: 0 }}
            whileInView={{ y: 0, opacity: 1 }}
            transition={{ duration: 0.7 }}
            viewport={{ once: true }}
            className="text-center mb-12"
          >
            <h2 className="text-3xl md:text-4xl font-bold mb-4 bg-clip-text text-transparent bg-gradient-to-r from-pink-400 to-purple-300">
              Get In Touch
            </h2>
            <div className="w-20 h-1 bg-gradient-to-r from-pink-500 to-purple-500 mx-auto"></div>
          </motion.div>

          <motion.div
            initial={{ y: 30, opacity: 0 }}
            whileInView={{ y: 0, opacity: 1 }}
            transition={{ delay: 0.3, duration: 0.7 }}
            viewport={{ once: true }}
            className="max-w-md mx-auto relative"
          >
            <div className="absolute inset-0 bg-white/5 rounded-2xl blur-lg transform translate-y-4"></div>
            <div className="relative z-10 bg-white/5 backdrop-blur-sm rounded-xl p-8 border border-white/10 shadow-xl text-center">
              <Mail className="w-10 h-10 text-pink-400 mx-auto mb-4" />
              <p className="text-xl text-white/90 mb-2">Have questions or feedback?</p>
              <a
                href="mailto:contact@flapp.meme"
                className="text-2xl font-medium text-white hover:text-pink-300 transition-colors"
              >
                contact@flapp.meme
              </a>
            </div>
          </motion.div>
        </div>
      </section>

      {/* Footer */}
      <footer className="relative py-8 z-10 border-t border-white/10">
        <div className="container mx-auto px-4">
          <div className="flex flex-col md:flex-row justify-between items-center">
            <div className="flex items-center gap-3 mb-4 md:mb-0">
              <div className="relative">
                <div className="absolute inset-0 bg-white/10 rounded-full blur-sm transform -translate-x-0.5 translate-y-0.5"></div>
                <Image
                  src="/images/logo.png"
                  alt="Flapp.meme Logo"
                  width={35}
                  height={35}
                  className="rounded-full relative z-10"
                />
              </div>
              <span className="text-lg font-bold bg-clip-text text-transparent bg-gradient-to-r from-pink-500 to-purple-300">
                Flapp.meme
              </span>
            </div>
            <div className="text-white/60 text-sm">
              © {new Date().getFullYear()} MEMESFLAPP TECHNOLOGIES PRIVATE LIMITED. All rights reserved.
            </div>
          </div>
        </div>
      </footer>
    </div>
  )
}
