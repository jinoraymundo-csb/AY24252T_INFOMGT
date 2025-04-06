- [Week 12: Aggregating Data](#week-12-aggregating-data)
  - [Counting Data](#counting-data)
  - [Counting Values](#counting-values)
  - [How Aggregates Work](#how-aggregates-work)
  - [Counting Selectively](#counting-selectively)
  - [Distinct Values](#distinct-values)
  - [Summarizing Numbers](#summarizing-numbers)
  - [Scales of Measurement](#scales-of-measurement)
  - [Aggregating Calculated Data](#aggregating-calculated-data)
  - [Other Aggregate Functions](#other-aggregate-functions)


# Week 12: Aggregating Data

It will be impractical to look at a result set with millions of rows of data. What's practical, however is:

- *Some* of the data
- A *summary* of the data

Getting a portion (or *some*) of the data is usually a matter of filtering using the `WHERE` clause. *Summarizing* the data is a matter of running the data through one or more **aggregate** functions, which will summarize either the whole set of data or smaller groups of it.

The simplest aggregate function is very intuitive:

```
SELECT count(*)
FROM customers;
```

> [!NOTE]
> The `count(*)` function counts all the rows. There is, of course, much more than that

> [!IMPORTANT]
> Aggregates can be applied to the whole of the data or in groups as in subtotals.

---

## Counting Data

The preceding `count()` function is a special case: `count(*)` counts all the *rows* in a dataset. The dataset, of course, may also be filtered:

```
SELECT count(*) AS countrows
FROM customers;
WHERE height < 160.5;
```

in which case, you will count the number of rows which match the criterion

[] TODO add image

## Counting Values

Apart from counting rows, you can caount values in a column:

```
SELECT
  count(*) as countrows,
  count(id) as ids,					        --	same
  count(email) as emails,				    --	same again
  count(familyname) as familynames,	--	same again
  count(phone) as phones,
  count(state) as states
FROM customers;
```

Which yields the following summary:

[] TODO add image

> [!NOTE]
> The number of rows will be the same as the number of `ids` and the number of `emails` and `familynames`. However, it is not the same for `phones` and `states`. When counting values
> - Every row *must* have a primary key (here, it is `id`), so the number of values in the primary key column is the same as the number of rows.
> - In this set of data, the email address and family name are required, so the number of values in the `email` column is also the same as the number of rows.
> - Not all of the customers have a (recorded) phone number, so this number is less than the number of rows.
> - The same goes for `state`s

> [!IMPORTANT]
> With the exception of counting rows, `count(...)` means to count the number of *values* in a column. Since `NULL` is not a value, `count()` skips over them and only counts what is there. 

---

## How Aggregates Work

With the preceding examples, you will note that the results, as with all `SELECT` statements, come in a virtual table. This virtual table always has a single row.

To understand the aggregate process, imagine that there are two tables: the a) original, possibly virtual, table and a b) summary table. The summary table is generated whenever SQL sees an aggregate query.

You can make the summarizing process more explicit:

```
SELECT
  count(*) as countrows,
  count(phone) as phones,
  count(dob) as dobs
FROM customers
GROUP BY ()
```

The `GROUP BY ()` clause means that the original table (`customers`) is to be summarized. It doesn't actually change anything, because it's implied whenever SQL encounters aggregate functions, such as `count()`

---

## Counting Selectively

Most of the paintings have a price value. You can count how many with:

```
SELECT count(price) FROM paintings;
```

Sometimes, you might want to count only some of these, such as the cheaper paintings or the more expensive ones.You could try this:

```
SELECT count(price) FROM paintings WHERE price < 130;
```

This will work, but you can't also include other summaries at the same time; you would need a separate query.

```
SELECT count(price < 130) FROM paintings;  -- does not work as expected
```

As a workaround, you may use the `CASE ... END` expression, to generate "categories" within your result set:

```
SELECT
  id, title, price,
  CASE
    WHEN price < 130 THEN 'inexpensive'
    WHEN price <= 170 THEN 'reasonable'
    WHEN price > 170 THEN 'prestige'
  END as pricegroup
FROM paintings;
```

[] TODO add image

In particular, you can use a simple version just to highlight the cheap ones:

```
SELECT
  id, title, price,
  CASE WHEN price < 130 THEN 'cheap' END as status
FROM paintings;
```

[] TODO add image

Back to aggregates, if we want to count the "cheap" paintings, we use the `CASE ... END` expression to set the values at 1, and count the results:

```
SELECT count(CASE WHEN price < 130 THEN 1 END) AS cheap
	FROM paintings;
```

[] TODO add image

> [!TIP] Remember that the ones that don't match will have a `NULL`, and aggregate functions always skip `NULL`, so they won't be counted.

At the same time, you can also include the other "categories":

```
SELECT
  count(CASE WHEN price < 130 THEN 1 END) AS cheap,
  count(CASE WHEN price BETWEEN 130 AND 170 THEN 1 END) AS reasonable,
  count(CASE WHEN price >= 170 THEN 1 END) AS expensive
FROM paintings;
```

[] TODO add image

---

## Distinct Values

How many states are in the `customers` table? You could try this:

```
SELECT
  count(state) AS states
FROM customers;
```

However, if you want to answer the question: "How many unique states are there in the customers table?":

```
--	List distinct states:
  SELECT DISTINCT state
  FROM customers;

--	Count distinct states:
  SELECT
    count(state) AS addresses,
    count(DISTINCT state) AS states
  FROM customers;
```

[] TODO add image

---

## Summarizing Numbers

When it comes to numbers, there are additional aggregate functions which are useful:

```
SELECT
  count(height) as heights,
  sum(height) AS total,
  avg(height) AS average,
  sum(height)/count(height) AS computed_average,
  stdev(height) AS sd
FROM customers;
```

> [!NOTE]
> The `sum()` function adds all the values in the column, and the `avg()` function calculates the average of the values. In the preceding example, the average is also calculated using the `sum/count` formula, and you see that it gives the same result; in principle, the `avg()` function is just a convenience.

> [!IMPORTANT]
> Note that all of the preceding aggregate functions only use actual values, and, as always, `NULL` is skipped. You won’t see any difference with `sum()`, but it is very important to note that the average is only calculated over the number of values, not the number of rows. If you had foolishly entered 0 for missing heights, they would have been included and drastically reduced the average.

You may see the results of this data error either by dividing by the total number of rows or by *coalescing* the `NULL`s to 0:

```
SELECT
  count(height) as heights,
  sum(height) AS total,
  avg(height) AS average,
  sum(height)/count(height) AS computed_average,
  stdev(height) AS sd,
  sum(height)/count(*) AS not_ca,
  avg(coalesce(height,0)) AS not_ca_again
FROM customers;
```

[] TODO add image

Notes:

- The expression s`um(height)/count(*)` divides the total height by the number of rows, not the number of heights, so the result will be much too low.

- The expression `coalesce(height,0)` substitutes the `NULL`s with a 0; these zeroes will be added, making no difference, but, again, you will be dividing by too many.

---

## Scales of Measurement

Statisticians sometimes talk about different uses of numbers. They’re all numbers, technically, but how they’re used will affect what you can do with them.

The following types are often referred to as **Scales of Measurement**

**Nominal**

Are used simply as coded, with no numeric significance at all

- Phone "numbers" are simply codes, but they don’t actually measure anything.
- You might assign a number to a category, such as type of artwork, but there’s no significance in either the value or the sort order.

**Ordinal**

Can be ordered, but there is no significance in the actual magnitude

- Ranking, where the position is significant, but the distance between values is insignificant
- Scales, such as opinions which range from good to bad

The id, which is used in the sample database for primary keys, would be in either the Nominal or Ordinal category, depending on whether you regard the sequence as significant.

**Interval**

The difference between numbers has meaning, but there is no fixed zero

- Distance from a fixed point (which is arbitrary)
- The year of an event (which is arbitrarily measured from the nonexistent year 0 AD)

> [!NOTE]
> There is no meaning in *adding* these numbers, but you can *subtract* them to get an interval between

**Ratio**
 
 With these numbers, there is a true zero, so magnitudes are significant

 - Total cost of a sale
 - Height of a person

 ---

 ## Aggregating Calculated Data

 The `salesitems` table includes some data which is worth summarizing:

 ```
SELECT * FROM salesitems;
 ```

[] TODO add image

This includes a quantity column, which is the number of copies of each item, and a `price` column which is the price *per copy* of each item.

You can total these columns, but you need to be sure that it's meaningful:

- The `quantity` column has the actual number of copies sold, so adding this is meaningful: it is the number of prints which had to be printed, packaged, or otherwise processed.

- The `price` column is the price per copy, so just adding this is *not* meaningful.

- However, you can *multiply* the price by the number of copies and then add them app

Bearing this in mind, the following should work:

```
SELECT
  sum(quantity) AS total_copies,
  sum(quantity * price) AS total_value
FROM saleitems;
```

which yields:

[] TODO add image

It should..... but there's a problem. Recall that some of the quantities are missing, so you had to coalesce the `NULL`s to 1 which is the presumed meaning. You'll have to do the same with the summary. Otherwise, that's erroneous data.

```
SELECT
  sum(coalesce(quantity,1)) AS total_copies,
  sum(coalesce(quantity,1)*price) AS total_value
FROM saleitems;
```

which should yield a more accurate result:

[] TODO add image

The `total_value` from the previous result should match the same value from the `sales` table:

```
SELECT sum(total) FROM sales;
```

[] TODO add image

---

## Other Aggregate Functions

So far, you have counted things, and, for numbers, you’ve run some statistical functions. There are other functions available, but here we will concentrate on just two: the `max()` and `min()` functions.

Like the `count()` function, you can use `max()` and `min()` on all main types of data. 

```
SELECT
  min(height) as shortest, max(height) as tallest,
  min(dob) as oldest, max(dob) as youngest,
  min(familyname) as first, max(familyname) as last
FROM customers;
```

[] TODO add image

> [!IMPORTANT]
> The `max()` and `min()` functions give you what would have been at the extreme ends of an `ORDER BY` clause, except that, as usual, they omit any `NULL` which might turn up.

---