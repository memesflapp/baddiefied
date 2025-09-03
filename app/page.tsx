import type { Metadata } from "next"
import LandingPageClient from "@/components/landing-page-client"
import { Suspense } from "react"

type Props = {
  // Available only in page.tsx segments
  searchParams?: { [key: string]: string | string[] | undefined }
}

export async function generateMetadata({ searchParams }: Props): Promise<Metadata> {
  const raw = searchParams?.section
  const section = Array.isArray(raw) ? raw[0] : raw

  const titleMap: Record<string, string> = {
    home: "Home",
    about: "About",
    privacy: "Privacy Policy",
    contact: "Contact",
  }

  const current = section && titleMap[section.toLowerCase()] ? titleMap[section.toLowerCase()] : "Home"
  const title = `${current} | Flapp.meme`

  return {
    title,
    openGraph: {
      title,
    },
  }
}

export default function Page() {
  return (
    <Suspense fallback={null}>
      <LandingPageClient />
    </Suspense>
  )
}
