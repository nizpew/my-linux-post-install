import React, { useState, useEffect } from 'react';
import MainLayout from '../components/layout/MainLayout';
import Masonry from 'react-masonry-css';
import { Box, Card, CardMedia, CardContent, Typography, IconButton, Skeleton } from '@mui/material';
import { Favorite, BookmarkAdd } from '@mui/icons-material';
import InfiniteScroll from 'react-infinite-scroll-component';

// Temporary type for development
interface Pin {
  id: string;
  title: string;
  image: string;
  likes: number;
  author: string;
}

const breakpointColumns = {
  default: 5,
  1400: 4,
  1100: 3,
  700: 2,
  500: 1
};

export default function Home() {
  const [pins, setPins] = useState<Pin[]>([]);
  const [loading, setLoading] = useState(true);
  const [hasMore, setHasMore] = useState(true);

  // Temporary function to generate mock data
  const generateMockPins = (count: number) => {
    return Array.from({ length: count }, (_, i) => ({
      id: `pin-${Date.now()}-${i}`,
      title: `Beautiful Pin ${i + 1}`,
      image: `https://source.unsplash.com/random/800x${Math.floor(Math.random() * 400 + 400)}?sig=${Date.now()}${i}`,
      likes: Math.floor(Math.random() * 1000),
      author: `User ${i + 1}`
    }));
  };

  useEffect(() => {
    // Simulate initial data fetch
    setTimeout(() => {
      setPins(generateMockPins(20));
      setLoading(false);
    }, 1000);
  }, []);

  const fetchMoreData = () => {
    // Simulate loading more data
    setTimeout(() => {
      setPins([...pins, ...generateMockPins(10)]);
    }, 1500);
  };

  return (
    <MainLayout>
      <Box sx={{ mt: 2 }}>
        {loading ? (
          <Masonry
            breakpointCols={breakpointColumns}
            className="flex -ml-4 w-auto"
            columnClassName="pl-4 bg-clip-padding"
          >
            {Array.from({ length: 20 }).map((_, index) => (
              <Box key={index} sx={{ mb: 4 }}>
                <Skeleton variant="rectangular" height={Math.random() * 200 + 200} />
              </Box>
            ))}
          </Masonry>
        ) : (
          <InfiniteScroll
            dataLength={pins.length}
            next={fetchMoreData}
            hasMore={hasMore}
            loader={<h4>Loading...</h4>}
          >
            <Masonry
              breakpointCols={breakpointColumns}
              className="flex -ml-4 w-auto"
              columnClassName="pl-4 bg-clip-padding"
            >
              {pins.map((pin) => (
                <Card 
                  key={pin.id} 
                  sx={{ 
                    mb: 4,
                    '&:hover': {
                      boxShadow: 6,
                      '& .actions': {
                        opacity: 1
                      }
                    }
                  }}
                >
                  <Box sx={{ position: 'relative' }}>
                    <CardMedia
                      component="img"
                      image={pin.image}
                      alt={pin.title}
                      sx={{ borderRadius: 2 }}
                    />
                    <Box
                      className="actions"
                      sx={{
                        position: 'absolute',
                        top: 0,
                        right: 0,
                        p: 1,
                        opacity: 0,
                        transition: 'opacity 0.3s',
                        background: 'linear-gradient(rgba(0,0,0,0.3), transparent)'
                      }}
                    >
                      <IconButton size="small" sx={{ color: 'white', mr: 1 }}>
                        <Favorite />
                      </IconButton>
                      <IconButton size="small" sx={{ color: 'white' }}>
                        <BookmarkAdd />
                      </IconButton>
                    </Box>
                  </Box>
                  <CardContent>
                    <Typography variant="subtitle1" noWrap>
                      {pin.title}
                    </Typography>
                    <Typography variant="body2" color="text.secondary">
                      {pin.author}
                    </Typography>
                  </CardContent>
                </Card>
              ))}
            </Masonry>
          </InfiniteScroll>
        )}
      </Box>
    </MainLayout>
  );
} 