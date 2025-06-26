import { describe, it, expect } from 'vitest'
import { render } from '@testing-library/react'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import { ApolloProvider } from '@apollo/client'
import { client } from '../src/lib/apollo'
import { JobFeed } from '../src/components/JobFeed'

const queryClient = new QueryClient()

describe('JobFeed', () => {
  it('renders without crashing', () => {
    render(
      <ApolloProvider client={client}>
        <QueryClientProvider client={queryClient}>
          <JobFeed conditionId="demo" />
        </QueryClientProvider>
      </ApolloProvider>
    )
  })
})
