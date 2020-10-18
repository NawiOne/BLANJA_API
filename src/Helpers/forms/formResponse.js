const formResponse = {
  succes: (res, data) => {
    const responseObject = {
      success: true,
      status: 200,
      data: data,
    };
    res.json(responseObject);
  },
  error: (res, error) => {
    const responseObject = {
      success: false,
      status: 500,
      error: error,
    };
    res.json(responseObject);
  },
  newProductPagination: ({ query }, res, data) => {
    const page = Number(query.page);
    const limit = Number(query.limit);
    const prevPage =
      page === 1 ? "" : `/product/new?page=${page - 1}&limit=${limit}`;
    const nextPage = data.length < limit? '' :`/product/new?page=${page + 1}&limit=${limit}`;

    const responseObject = {
      success: true,
      status: 200,
      data,
      pageInfo: {
        currentPage: query.page,
        limit: query.limit,
        prevPage,
        nextPage,
      },
    };
    res.json(responseObject);
  },
  categoryPagination: ({ query }, res, data) => {
    const page = Number(query.page);
    const limit = Number(query.limit);
    const category = query.category
    console.log(category)
    const prevPage =
      page === 1 ? "" : `/product/category?category=${query.category}&page=${page - 1}&limit=${limit}`;
    const nextPage = data.length < limit? '' :`/product/category?category=${category}&page=${page + 1}&limit=${limit}`;

    const responseObject = {
      success: true,
      status: 200,
      data,
      pageInfo: {
        currentPage: query.page,
        limit: query.limit,
        prevPage,
        nextPage,
      },
    };
    res.json(responseObject);
  },
  pagination: ({ query }, res, data) => {
    const page = Number(query.page);
    const limit = Number(query.limit);
    const search = query.search
    const prevPage =
      page === 1 ? "" : `/product?search=${search}&page=${page - 1}&limit=${limit}`;
    const nextPage = data.length < limit? '' :`/product?search=${search}&page=${page - 1}&limit=${limit}`;

    const responseObject = {
      success: true,
      status: 200,
      data,
      pageInfo: {
        currentPage: query.page,
        limit: query.limit,
        prevPage,
        nextPage,
      },
    };
    res.json(responseObject);
  },
};

module.exports = formResponse;
