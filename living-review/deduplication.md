# Deduplication of bibliographic records

We perform rule-based deduplication based on methods described [Jiang et al. (2014)](https://academic.oup.com/database/article/doi/10.1093/database/bat086/2633762) and [Bramer et al. (2016)](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4915647/).

Additionally, we calculate score of similarity based on different algorithms [more soon].

These scores are used to predict the duplication status (duplicate/unique) of a know dataset. Thus, we need test data where duplicates are detected as a 'gold standard'. 

# Comparison of different methods 

## Test data

We prepared test data to evaluate the deduplication algorithm

## Data set 27.02.2020: 'Zika query' 

Query comparison:

query_embase = "(zika and guillain-barre).mp"

PMquery="(zika and guillain-barre)"

We run the queries both in OVID and Pubmed website number returned:

Embase: 1163 (Embase through OVID -> exported as RIS)
Pubmed:  728

Note: Pubmed website returns nbib per 200 citations, merged in endnote and exported to RIS.

Same queries are run in the APIs:

Embase: 1163
Pubmed:  726

## Evaluating the performance of the deduplication algorithm

Here, we compare the performance of our deduplication algorithm implemented in R with the 'gold standard': Deduplication in Endnote according to the protocol of [Bramer et al. (2016)](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4915647/). 
For every record, we assess whether it was identified as part of a duplicate or as a unique record. We compare this against the Bramer method:

| our algorithm | Bramer\\Duplicate |  Bramer\\Unique  |
|---------------|-------------------|------------------|
| Duplicate     | true positive     | false positive   |
| Unique        | false negative    | true negative    |

* Sensitivity: true positive/(true positive + false negative)
* Specificity: true negative/(true negative + false postive)

We want to avoid falsly identifying records as duplicates (false positives). This means we strive for a near perfect specificity. 
