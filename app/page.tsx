import type { Metadata } from "next"
import LandingPageClient from "@/components/landing-page-client"
import { Suspense } from "react"

type Props = {
  // Available only in page.tsx segments
  searchParams?: { [key: string]: string | string[] | undefined }
}

export async function generateMetadata(): Promise<Metadata> {
  return {
    title: "Flapp.meme",
    openGraph: {
      title: "Flapp.meme",
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
