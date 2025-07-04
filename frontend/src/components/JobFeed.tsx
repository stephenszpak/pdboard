import { gql, useApolloClient, useSubscription } from '@apollo/client'
import { useQuery, useQueryClient } from '@tanstack/react-query'

const JOBS = gql`
  query($conditionId: ID!) {
    job_postings(condition_id: $conditionId) {
      id
      title
      company
      url
    }
  }
`

const JOB_ADDED = gql`
  subscription($conditionId: ID!) {
    job_posting_added(condition_id: $conditionId) {
      id
      title
      company
      url
    }
  }
`

export function JobFeed({ conditionId }: { conditionId: string }) {
  const client = useApolloClient()
  const queryClient = useQueryClient()

  const { data } = useQuery({
    queryKey: ['jobs', conditionId],
    queryFn: async () => {
      const { data } = await client.query({ query: JOBS, variables: { conditionId } })
      return data.job_postings
    }
  })

  useSubscription(JOB_ADDED, {
    variables: { conditionId },
    onData: ({ data }) => {
      const posting = data.data?.job_posting_added
      if (posting) {
        queryClient.setQueryData(['jobs', conditionId], (old: any = []) => [...old, posting])
      }
    }
  })

  if (!data) return <p>Loading...</p>

  return (
    <ul className="jobfeed" role="list">
      {data.map((p: any) => (
        <li key={p.id} className="jobfeed__item">
          <a href={p.url} className="jobfeed__link" target="_blank" rel="noreferrer">
            {p.title}
          </a>
          {p.company && <span className="jobfeed__company"> - {p.company}</span>}
        </li>
      ))}
    </ul>
  )
}
